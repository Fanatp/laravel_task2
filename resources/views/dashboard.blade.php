<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">

                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td><b>Профессия</b></td>
                                <td><b>Список навыков для профессии</b></td>
                                <td><b>Список учебных заведений для профессии</b></td>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($professions as $profession)
                        <tr>
                            <td>{{$profession->id}} - {{$profession->name}}</td>
                            <td>
                                @foreach($profession->skills as $skill)
                                    {{ $skill->name }}<br>
                                @endforeach
                            </td>
                            <td>
                                @foreach( $profession->instituts as $institut)
                                {{$institut->name}}<Br>
                                @endforeach
                            </td>
                        </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
